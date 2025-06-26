; ModuleID = 'svp_simple_001_001.bc'
source_filename = "./svp_simple_001_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_001_001_global_flag = global i32 0, align 4
@svp_simple_001_001_global_array = common global [10000 x i32] zeroinitializer, align 16
@svp_simple_001_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_001_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  call void @disable_isr(i32 2), !dbg !11
  call void (...) @idlerun(), !dbg !12
  %3 = bitcast i32* %1 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !13
  store i32 0, i32* %1, align 4, !dbg !14, !tbaa !15
  br label %4, !dbg !13

4:                                                ; preds = %13, %0
  %5 = load i32, i32* %1, align 4, !dbg !19, !tbaa !15
  %6 = icmp slt i32 %5, 10000, !dbg !20
  br i1 %6, label %9, label %7, !dbg !21

7:                                                ; preds = %4
  %8 = bitcast i32* %1 to i8*, !dbg !21
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #3, !dbg !21
  br label %16

9:                                                ; preds = %4
  %10 = load i32, i32* %1, align 4, !dbg !22, !tbaa !15
  %11 = sext i32 %10 to i64, !dbg !23
  %12 = getelementptr inbounds [10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 %11, !dbg !23
  store volatile i32 0, i32* %12, align 4, !dbg !24, !tbaa !15
  br label %13, !dbg !23

13:                                               ; preds = %9
  %14 = load i32, i32* %1, align 4, !dbg !25, !tbaa !15
  %15 = add nsw i32 %14, 1, !dbg !25
  store i32 %15, i32* %1, align 4, !dbg !25, !tbaa !15
  br label %4, !dbg !21, !llvm.loop !26

16:                                               ; preds = %7
  %17 = bitcast i32* %2 to i8*, !dbg !28
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #3, !dbg !28
  store i32 0, i32* %2, align 4, !dbg !29, !tbaa !15
  br label %18, !dbg !28

18:                                               ; preds = %31, %16
  %19 = load i32, i32* %2, align 4, !dbg !30, !tbaa !15
  %20 = icmp slt i32 %19, 10000, !dbg !31
  br i1 %20, label %23, label %21, !dbg !32

21:                                               ; preds = %18
  %22 = bitcast i32* %2 to i8*, !dbg !32
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3, !dbg !32
  br label %34

23:                                               ; preds = %18
  %24 = load i32, i32* %2, align 4, !dbg !33, !tbaa !15
  %25 = icmp eq i32 %24, 9999, !dbg !34
  br i1 %25, label %26, label %30, !dbg !33

26:                                               ; preds = %23
  %27 = load i32, i32* %2, align 4, !dbg !35, !tbaa !15
  %28 = sext i32 %27 to i64, !dbg !36
  %29 = getelementptr inbounds [10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 %28, !dbg !36
  store volatile i32 1, i32* %29, align 4, !dbg !37, !tbaa !15
  br label %30, !dbg !36

30:                                               ; preds = %26, %23
  br label %31, !dbg !38

31:                                               ; preds = %30
  %32 = load i32, i32* %2, align 4, !dbg !39, !tbaa !15
  %33 = add nsw i32 %32, 1, !dbg !39
  store i32 %33, i32* %2, align 4, !dbg !39, !tbaa !15
  br label %18, !dbg !32, !llvm.loop !40

34:                                               ; preds = %21
  ret void, !dbg !41
}

declare void @init(...) #1

declare void @disable_isr(i32) #1

declare void @idlerun(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_001_001_isr_1() #0 !dbg !42 {
  call void (...) @idlerun(), !dbg !43
  store volatile i32 1, i32* @svp_simple_001_001_global_flag, align 4, !dbg !44, !tbaa !15
  store volatile i32 0, i32* @svp_simple_001_001_global_var, align 4, !dbg !45, !tbaa !15
  store volatile i32 1, i32* @svp_simple_001_001_global_var, align 4, !dbg !46, !tbaa !15
  call void @enable_isr(i32 2), !dbg !47
  call void (...) @idlerun(), !dbg !48
  ret void, !dbg !49
}

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_001_001_isr_2() #0 !dbg !50 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = bitcast i32* %1 to i8*, !dbg !51
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !51
  %5 = bitcast i32* %2 to i8*, !dbg !51
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !51
  %6 = load volatile i32, i32* @svp_simple_001_001_global_flag, align 4, !dbg !52, !tbaa !15
  %7 = icmp eq i32 %6, 1, !dbg !53
  br i1 %7, label %8, label %10, !dbg !52

8:                                                ; preds = %0
  %9 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 9999), align 4, !dbg !54, !tbaa !15
  store i32 %9, i32* %1, align 4, !dbg !55, !tbaa !15
  br label %12, !dbg !56

10:                                               ; preds = %0
  %11 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 0), align 16, !dbg !57, !tbaa !15
  store i32 %11, i32* %1, align 4, !dbg !58, !tbaa !15
  br label %12

12:                                               ; preds = %10, %8
  %13 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 1000), align 16, !dbg !59, !tbaa !15
  store i32 %13, i32* %2, align 4, !dbg !60, !tbaa !15
  %14 = bitcast i32* %3 to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %14) #3, !dbg !61
  %15 = load volatile i32, i32* @svp_simple_001_001_global_var, align 4, !dbg !62, !tbaa !15
  store i32 %15, i32* %3, align 4, !dbg !63, !tbaa !15
  %16 = bitcast i32* %3 to i8*, !dbg !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #3, !dbg !64
  %17 = bitcast i32* %2 to i8*, !dbg !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #3, !dbg !64
  %18 = bitcast i32* %1 to i8*, !dbg !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3, !dbg !64
  ret void, !dbg !64
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_001_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_001")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_001_001_main", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_001_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_001")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 26, column: 3, scope: !7)
!11 = !DILocation(line: 28, column: 3, scope: !7)
!12 = !DILocation(line: 30, column: 3, scope: !7)
!13 = !DILocation(line: 32, column: 8, scope: !7)
!14 = !DILocation(line: 32, column: 12, scope: !7)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 32, column: 19, scope: !7)
!20 = !DILocation(line: 32, column: 21, scope: !7)
!21 = !DILocation(line: 32, column: 3, scope: !7)
!22 = !DILocation(line: 32, column: 67, scope: !7)
!23 = !DILocation(line: 32, column: 35, scope: !7)
!24 = !DILocation(line: 32, column: 70, scope: !7)
!25 = !DILocation(line: 32, column: 31, scope: !7)
!26 = distinct !{!26, !21, !27}
!27 = !DILocation(line: 32, column: 72, scope: !7)
!28 = !DILocation(line: 34, column: 8, scope: !7)
!29 = !DILocation(line: 34, column: 12, scope: !7)
!30 = !DILocation(line: 34, column: 19, scope: !7)
!31 = !DILocation(line: 34, column: 21, scope: !7)
!32 = !DILocation(line: 34, column: 3, scope: !7)
!33 = !DILocation(line: 35, column: 9, scope: !7)
!34 = !DILocation(line: 35, column: 11, scope: !7)
!35 = !DILocation(line: 35, column: 55, scope: !7)
!36 = !DILocation(line: 35, column: 23, scope: !7)
!37 = !DILocation(line: 35, column: 58, scope: !7)
!38 = !DILocation(line: 36, column: 3, scope: !7)
!39 = !DILocation(line: 34, column: 31, scope: !7)
!40 = distinct !{!40, !32, !38}
!41 = !DILocation(line: 37, column: 1, scope: !7)
!42 = distinct !DISubprogram(name: "svp_simple_001_001_isr_1", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 40, column: 3, scope: !42)
!44 = !DILocation(line: 41, column: 34, scope: !42)
!45 = !DILocation(line: 43, column: 33, scope: !42)
!46 = !DILocation(line: 44, column: 33, scope: !42)
!47 = !DILocation(line: 46, column: 3, scope: !42)
!48 = !DILocation(line: 48, column: 3, scope: !42)
!49 = !DILocation(line: 49, column: 1, scope: !42)
!50 = distinct !DISubprogram(name: "svp_simple_001_001_isr_2", scope: !8, file: !8, line: 51, type: !9, scopeLine: 51, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 52, column: 3, scope: !50)
!52 = !DILocation(line: 53, column: 7, scope: !50)
!53 = !DILocation(line: 53, column: 38, scope: !50)
!54 = !DILocation(line: 55, column: 15, scope: !50)
!55 = !DILocation(line: 55, column: 13, scope: !50)
!56 = !DILocation(line: 55, column: 5, scope: !50)
!57 = !DILocation(line: 58, column: 9, scope: !50)
!58 = !DILocation(line: 57, column: 13, scope: !50)
!59 = !DILocation(line: 60, column: 13, scope: !50)
!60 = !DILocation(line: 60, column: 11, scope: !50)
!61 = !DILocation(line: 63, column: 3, scope: !50)
!62 = !DILocation(line: 64, column: 13, scope: !50)
!63 = !DILocation(line: 64, column: 11, scope: !50)
!64 = !DILocation(line: 65, column: 1, scope: !50)
