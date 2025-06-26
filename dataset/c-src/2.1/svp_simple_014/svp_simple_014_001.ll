; ModuleID = 'svp_simple_014_001.bc'
source_filename = "./svp_simple_014_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_014_001_global_var1 = global i32 1, align 4
@svp_simple_014_001_global_var2 = global i32 2, align 4
@svp_simple_014_001_global_flag1 = global i32 0, align 4
@svp_simple_014_001_global_flag2 = global i32 1, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_014_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  call void (...) @idlerun(), !dbg !11
  ret void, !dbg !12
}

declare void @init(...) #1

declare void @idlerun(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_014_001_isr_1() #0 !dbg !13 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  call void @disable_isr(i32 3), !dbg !14
  %6 = bitcast i32* %1 to i8*, !dbg !15
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !15
  %7 = bitcast i32* %2 to i8*, !dbg !15
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !15
  %8 = bitcast i32* %3 to i8*, !dbg !16
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !16
  %9 = bitcast i32* %4 to i8*, !dbg !16
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !16
  %10 = bitcast i32* %5 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !17
  store i32 0, i32* %5, align 4, !dbg !18, !tbaa !19
  br label %11, !dbg !17

11:                                               ; preds = %22, %0
  %12 = load i32, i32* %5, align 4, !dbg !23, !tbaa !19
  %13 = icmp slt i32 %12, 100, !dbg !24
  br i1 %13, label %16, label %14, !dbg !25

14:                                               ; preds = %11
  %15 = bitcast i32* %5 to i8*, !dbg !25
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3, !dbg !25
  br label %25

16:                                               ; preds = %11
  %17 = load i32, i32* %5, align 4, !dbg !26, !tbaa !19
  %18 = icmp eq i32 %17, 99, !dbg !27
  br i1 %18, label %19, label %21, !dbg !26

19:                                               ; preds = %16
  %20 = load volatile i32, i32* @svp_simple_014_001_global_var1, align 4, !dbg !28, !tbaa !19
  store i32 %20, i32* %1, align 4, !dbg !29, !tbaa !19
  br label %21, !dbg !30

21:                                               ; preds = %19, %16
  br label %22, !dbg !31

22:                                               ; preds = %21
  %23 = load i32, i32* %5, align 4, !dbg !32, !tbaa !19
  %24 = add nsw i32 %23, 1, !dbg !32
  store i32 %24, i32* %5, align 4, !dbg !32, !tbaa !19
  br label %11, !dbg !25, !llvm.loop !33

25:                                               ; preds = %14
  %26 = load volatile i32, i32* @svp_simple_014_001_global_var1, align 4, !dbg !34, !tbaa !19
  store i32 %26, i32* %2, align 4, !dbg !35, !tbaa !19
  %27 = load volatile i32, i32* @svp_simple_014_001_global_var2, align 4, !dbg !36, !tbaa !19
  store i32 %27, i32* %3, align 4, !dbg !37, !tbaa !19
  %28 = load volatile i32, i32* @svp_simple_014_001_global_var2, align 4, !dbg !38, !tbaa !19
  store i32 %28, i32* %4, align 4, !dbg !39, !tbaa !19
  %29 = bitcast i32* %4 to i8*, !dbg !40
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3, !dbg !40
  %30 = bitcast i32* %3 to i8*, !dbg !40
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #3, !dbg !40
  %31 = bitcast i32* %2 to i8*, !dbg !40
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #3, !dbg !40
  %32 = bitcast i32* %1 to i8*, !dbg !40
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !40
  ret void, !dbg !40
}

declare void @disable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_014_001_isr_2() #0 !dbg !41 {
  store i32 1, i32* @svp_simple_014_001_global_flag1, align 4, !dbg !42, !tbaa !19
  store i32 0, i32* @svp_simple_014_001_global_flag2, align 4, !dbg !43, !tbaa !19
  call void @enable_isr(i32 3), !dbg !44
  call void (...) @idlerun(), !dbg !45
  ret void, !dbg !46
}

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_014_001_isr_3() #0 !dbg !47 {
  %1 = load i32, i32* @svp_simple_014_001_global_flag1, align 4, !dbg !48, !tbaa !19
  %2 = icmp eq i32 %1, 1, !dbg !49
  br i1 %2, label %3, label %4, !dbg !48

3:                                                ; preds = %0
  store volatile i32 9, i32* @svp_simple_014_001_global_var1, align 4, !dbg !50, !tbaa !19
  br label %4, !dbg !51

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @svp_simple_014_001_global_flag2, align 4, !dbg !52, !tbaa !19
  %6 = icmp eq i32 %5, 1, !dbg !53
  br i1 %6, label %7, label %8, !dbg !52

7:                                                ; preds = %4
  store volatile i32 9, i32* @svp_simple_014_001_global_var2, align 4, !dbg !54, !tbaa !19
  br label %8, !dbg !55

8:                                                ; preds = %7, %4
  ret void, !dbg !56
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_014_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_014")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_014_001_main", scope: !8, file: !8, line: 13, type: !9, scopeLine: 13, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_014_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_014")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 14, column: 3, scope: !7)
!11 = !DILocation(line: 15, column: 3, scope: !7)
!12 = !DILocation(line: 16, column: 1, scope: !7)
!13 = distinct !DISubprogram(name: "svp_simple_014_001_isr_1", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!14 = !DILocation(line: 19, column: 3, scope: !13)
!15 = !DILocation(line: 20, column: 3, scope: !13)
!16 = !DILocation(line: 21, column: 3, scope: !13)
!17 = !DILocation(line: 23, column: 8, scope: !13)
!18 = !DILocation(line: 23, column: 12, scope: !13)
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C/C++ TBAA"}
!23 = !DILocation(line: 23, column: 19, scope: !13)
!24 = !DILocation(line: 23, column: 21, scope: !13)
!25 = !DILocation(line: 23, column: 3, scope: !13)
!26 = !DILocation(line: 24, column: 9, scope: !13)
!27 = !DILocation(line: 24, column: 11, scope: !13)
!28 = !DILocation(line: 24, column: 33, scope: !13)
!29 = !DILocation(line: 24, column: 31, scope: !13)
!30 = !DILocation(line: 24, column: 23, scope: !13)
!31 = !DILocation(line: 24, column: 14, scope: !13)
!32 = !DILocation(line: 23, column: 36, scope: !13)
!33 = distinct !{!33, !25, !28}
!34 = !DILocation(line: 26, column: 13, scope: !13)
!35 = !DILocation(line: 26, column: 11, scope: !13)
!36 = !DILocation(line: 28, column: 13, scope: !13)
!37 = !DILocation(line: 28, column: 11, scope: !13)
!38 = !DILocation(line: 30, column: 13, scope: !13)
!39 = !DILocation(line: 30, column: 11, scope: !13)
!40 = !DILocation(line: 31, column: 1, scope: !13)
!41 = distinct !DISubprogram(name: "svp_simple_014_001_isr_2", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 34, column: 35, scope: !41)
!43 = !DILocation(line: 35, column: 35, scope: !41)
!44 = !DILocation(line: 37, column: 3, scope: !41)
!45 = !DILocation(line: 39, column: 3, scope: !41)
!46 = !DILocation(line: 40, column: 1, scope: !41)
!47 = distinct !DISubprogram(name: "svp_simple_014_001_isr_3", scope: !8, file: !8, line: 42, type: !9, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 43, column: 7, scope: !47)
!49 = !DILocation(line: 43, column: 39, scope: !47)
!50 = !DILocation(line: 43, column: 76, scope: !47)
!51 = !DILocation(line: 43, column: 45, scope: !47)
!52 = !DILocation(line: 44, column: 7, scope: !47)
!53 = !DILocation(line: 44, column: 39, scope: !47)
!54 = !DILocation(line: 44, column: 76, scope: !47)
!55 = !DILocation(line: 44, column: 45, scope: !47)
!56 = !DILocation(line: 45, column: 1, scope: !47)
