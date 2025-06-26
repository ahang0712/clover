; ModuleID = 'svp_simple_013_001.bc'
source_filename = "./svp_simple_013_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_013_001_global_flag1 = global i32 0, align 4
@svp_simple_013_001_global_flag2 = global i32 1, align 4
@svp_simple_013_001_global_var1 = common global i32 0, align 4
@svp_simple_013_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_013_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  call void @disable_isr(i32 2), !dbg !11
  call void @disable_isr(i32 3), !dbg !12
  %6 = bitcast i32* %1 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !13
  %7 = bitcast i32* %2 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !13
  %8 = bitcast i32* %3 to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !14
  %9 = bitcast i32* %4 to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !14
  %10 = bitcast i32* %5 to i8*, !dbg !15
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !15
  store i32 0, i32* %5, align 4, !dbg !16, !tbaa !17
  br label %11, !dbg !15

11:                                               ; preds = %22, %0
  %12 = load i32, i32* %5, align 4, !dbg !21, !tbaa !17
  %13 = icmp slt i32 %12, 100, !dbg !22
  br i1 %13, label %16, label %14, !dbg !23

14:                                               ; preds = %11
  %15 = bitcast i32* %5 to i8*, !dbg !23
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3, !dbg !23
  br label %25

16:                                               ; preds = %11
  %17 = load i32, i32* %5, align 4, !dbg !24, !tbaa !17
  %18 = icmp eq i32 %17, 99, !dbg !25
  br i1 %18, label %19, label %21, !dbg !24

19:                                               ; preds = %16
  %20 = load volatile i32, i32* @svp_simple_013_001_global_var1, align 4, !dbg !26, !tbaa !17
  store i32 %20, i32* %1, align 4, !dbg !27, !tbaa !17
  br label %21, !dbg !28

21:                                               ; preds = %19, %16
  br label %22, !dbg !29

22:                                               ; preds = %21
  %23 = load i32, i32* %5, align 4, !dbg !30, !tbaa !17
  %24 = add nsw i32 %23, 1, !dbg !30
  store i32 %24, i32* %5, align 4, !dbg !30, !tbaa !17
  br label %11, !dbg !23, !llvm.loop !31

25:                                               ; preds = %14
  %26 = load volatile i32, i32* @svp_simple_013_001_global_var1, align 4, !dbg !32, !tbaa !17
  store i32 %26, i32* %2, align 4, !dbg !33, !tbaa !17
  %27 = load volatile i32, i32* @svp_simple_013_001_global_var2, align 4, !dbg !34, !tbaa !17
  store i32 %27, i32* %3, align 4, !dbg !35, !tbaa !17
  %28 = load volatile i32, i32* @svp_simple_013_001_global_var2, align 4, !dbg !36, !tbaa !17
  store i32 %28, i32* %4, align 4, !dbg !37, !tbaa !17
  %29 = bitcast i32* %4 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3, !dbg !38
  %30 = bitcast i32* %3 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #3, !dbg !38
  %31 = bitcast i32* %2 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #3, !dbg !38
  %32 = bitcast i32* %1 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !38
  ret void, !dbg !38
}

declare void @init(...) #1

declare void @disable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_013_001_isr_1() #0 !dbg !39 {
  call void (...) @idlerun(), !dbg !40
  call void @enable_isr(i32 2), !dbg !41
  call void (...) @idlerun(), !dbg !42
  ret void, !dbg !43
}

declare void @idlerun(...) #1

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_013_001_isr_2() #0 !dbg !44 {
  call void (...) @idlerun(), !dbg !45
  store i32 1, i32* @svp_simple_013_001_global_flag1, align 4, !dbg !46, !tbaa !17
  store i32 0, i32* @svp_simple_013_001_global_flag2, align 4, !dbg !47, !tbaa !17
  call void @enable_isr(i32 3), !dbg !48
  call void (...) @idlerun(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind uwtable
define void @svp_simple_013_001_isr_3() #0 !dbg !51 {
  %1 = load i32, i32* @svp_simple_013_001_global_flag1, align 4, !dbg !52, !tbaa !17
  %2 = icmp eq i32 %1, 1, !dbg !53
  br i1 %2, label %3, label %4, !dbg !52

3:                                                ; preds = %0
  store volatile i32 1, i32* @svp_simple_013_001_global_var1, align 4, !dbg !54, !tbaa !17
  br label %4, !dbg !55

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @svp_simple_013_001_global_flag2, align 4, !dbg !56, !tbaa !17
  %6 = icmp eq i32 %5, 1, !dbg !57
  br i1 %6, label %7, label %8, !dbg !56

7:                                                ; preds = %4
  store volatile i32 1, i32* @svp_simple_013_001_global_var2, align 4, !dbg !58, !tbaa !17
  br label %8, !dbg !59

8:                                                ; preds = %7, %4
  ret void, !dbg !60
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_013_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_013")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_013_001_main", scope: !8, file: !8, line: 13, type: !9, scopeLine: 13, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_013_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_013")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 14, column: 3, scope: !7)
!11 = !DILocation(line: 15, column: 3, scope: !7)
!12 = !DILocation(line: 16, column: 3, scope: !7)
!13 = !DILocation(line: 20, column: 3, scope: !7)
!14 = !DILocation(line: 21, column: 3, scope: !7)
!15 = !DILocation(line: 23, column: 8, scope: !7)
!16 = !DILocation(line: 23, column: 12, scope: !7)
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C/C++ TBAA"}
!21 = !DILocation(line: 23, column: 19, scope: !7)
!22 = !DILocation(line: 23, column: 21, scope: !7)
!23 = !DILocation(line: 23, column: 3, scope: !7)
!24 = !DILocation(line: 24, column: 9, scope: !7)
!25 = !DILocation(line: 24, column: 11, scope: !7)
!26 = !DILocation(line: 24, column: 33, scope: !7)
!27 = !DILocation(line: 24, column: 31, scope: !7)
!28 = !DILocation(line: 24, column: 23, scope: !7)
!29 = !DILocation(line: 24, column: 14, scope: !7)
!30 = !DILocation(line: 23, column: 36, scope: !7)
!31 = distinct !{!31, !23, !26}
!32 = !DILocation(line: 26, column: 13, scope: !7)
!33 = !DILocation(line: 26, column: 11, scope: !7)
!34 = !DILocation(line: 28, column: 13, scope: !7)
!35 = !DILocation(line: 28, column: 11, scope: !7)
!36 = !DILocation(line: 30, column: 13, scope: !7)
!37 = !DILocation(line: 30, column: 11, scope: !7)
!38 = !DILocation(line: 31, column: 1, scope: !7)
!39 = distinct !DISubprogram(name: "svp_simple_013_001_isr_1", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 34, column: 3, scope: !39)
!41 = !DILocation(line: 35, column: 3, scope: !39)
!42 = !DILocation(line: 36, column: 3, scope: !39)
!43 = !DILocation(line: 37, column: 1, scope: !39)
!44 = distinct !DISubprogram(name: "svp_simple_013_001_isr_2", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 40, column: 3, scope: !44)
!46 = !DILocation(line: 41, column: 35, scope: !44)
!47 = !DILocation(line: 43, column: 35, scope: !44)
!48 = !DILocation(line: 45, column: 3, scope: !44)
!49 = !DILocation(line: 46, column: 3, scope: !44)
!50 = !DILocation(line: 47, column: 1, scope: !44)
!51 = distinct !DISubprogram(name: "svp_simple_013_001_isr_3", scope: !8, file: !8, line: 49, type: !9, scopeLine: 49, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 50, column: 7, scope: !51)
!53 = !DILocation(line: 50, column: 39, scope: !51)
!54 = !DILocation(line: 50, column: 76, scope: !51)
!55 = !DILocation(line: 50, column: 45, scope: !51)
!56 = !DILocation(line: 51, column: 7, scope: !51)
!57 = !DILocation(line: 51, column: 39, scope: !51)
!58 = !DILocation(line: 51, column: 76, scope: !51)
!59 = !DILocation(line: 51, column: 45, scope: !51)
!60 = !DILocation(line: 52, column: 1, scope: !51)
