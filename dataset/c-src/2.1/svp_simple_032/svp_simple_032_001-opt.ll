; ModuleID = 'svp_simple_032_001-opt.bc'
source_filename = "./svp_simple_032_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_022_001_global_var1 = common global i32 0, align 4
@svp_simple_022_001_global_var2 = common global i32 0, align 4
@svp_simple_022_001_global_var3 = common global i32 0, align 4
@svp_simple_022_001_global_array = common global [256 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_main() #0 !dbg !7 {
  %1 = call i32 (...) @rand(), !dbg !10
  store volatile i32 %1, i32* @svp_simple_022_001_global_var1, align 4, !dbg !11, !tbaa !12
  %2 = call i32 (...) @rand(), !dbg !16
  store volatile i32 %2, i32* @svp_simple_022_001_global_var2, align 4, !dbg !17, !tbaa !12
  %3 = call i32 (...) @rand(), !dbg !18
  store volatile i32 %3, i32* @svp_simple_022_001_global_var3, align 4, !dbg !19, !tbaa !12
  call void (...) @init(), !dbg !20
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !21, !tbaa !12
  %4 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !22, !tbaa !12
  %5 = icmp sge i32 %4, 12, !dbg !23
  br i1 %5, label %6, label %7, !dbg !22

6:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !24, !tbaa !12
  br label %8, !dbg !25

7:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !26, !tbaa !12
  br label %8

8:                                                ; preds = %7, %6
  br label %9, !dbg !27

9:                                                ; preds = %14, %8
  %.0 = phi i32 [ 0, %8 ], [ %15, %14 ], !dbg !28
  %10 = icmp slt i32 %.0, 256, !dbg !29
  br i1 %10, label %11, label %16, !dbg !30

11:                                               ; preds = %9
  %12 = sext i32 %.0 to i64, !dbg !31
  %13 = getelementptr inbounds [256 x i32], [256 x i32]* @svp_simple_022_001_global_array, i64 0, i64 %12, !dbg !31
  store volatile i32 0, i32* %13, align 4, !dbg !32, !tbaa !12
  br label %14, !dbg !33

14:                                               ; preds = %11
  %15 = add nsw i32 %.0, 1, !dbg !34
  br label %9, !dbg !30, !llvm.loop !35

16:                                               ; preds = %9
  %17 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !36, !tbaa !12
  store volatile i32 %17, i32* @svp_simple_022_001_global_var3, align 4, !dbg !37, !tbaa !12
  %18 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !38, !tbaa !12
  store volatile i32 %18, i32* @svp_simple_022_001_global_var3, align 4, !dbg !39, !tbaa !12
  ret void, !dbg !40
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_init() #0 !dbg !41 {
  %1 = call i32 (...) @rand(), !dbg !42
  store volatile i32 %1, i32* @svp_simple_022_001_global_var1, align 4, !dbg !43, !tbaa !12
  %2 = call i32 (...) @rand(), !dbg !44
  store volatile i32 %2, i32* @svp_simple_022_001_global_var2, align 4, !dbg !45, !tbaa !12
  %3 = call i32 (...) @rand(), !dbg !46
  store volatile i32 %3, i32* @svp_simple_022_001_global_var3, align 4, !dbg !47, !tbaa !12
  call void (...) @init(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_1() #0 !dbg !50 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !51, !tbaa !12
  %2 = icmp sge i32 %1, 12, !dbg !52
  br i1 %2, label %3, label %4, !dbg !51

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !53, !tbaa !12
  br label %5, !dbg !54

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !55, !tbaa !12
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_2() #0 !dbg !57 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !58, !tbaa !12
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !59, !tbaa !12
  ret void, !dbg !60
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_3() #0 !dbg !61 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !62, !tbaa !12
  %2 = icmp sge i32 %1, 12, !dbg !63
  br i1 %2, label %3, label %4, !dbg !62

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !64, !tbaa !12
  br label %5, !dbg !65

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !66, !tbaa !12
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !67
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_4() #0 !dbg !68 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !69, !tbaa !12
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !70, !tbaa !12
  ret void, !dbg !71
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_isr_1() #0 !dbg !72 {
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !73, !tbaa !12
  ret void, !dbg !74
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_032_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_032")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_032_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_032")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 19, column: 38, scope: !7)
!11 = !DILocation(line: 19, column: 36, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 20, column: 38, scope: !7)
!17 = !DILocation(line: 20, column: 36, scope: !7)
!18 = !DILocation(line: 21, column: 38, scope: !7)
!19 = !DILocation(line: 21, column: 36, scope: !7)
!20 = !DILocation(line: 23, column: 5, scope: !7)
!21 = !DILocation(line: 25, column: 34, scope: !7)
!22 = !DILocation(line: 26, column: 11, scope: !7)
!23 = !DILocation(line: 26, column: 42, scope: !7)
!24 = !DILocation(line: 28, column: 40, scope: !7)
!25 = !DILocation(line: 29, column: 7, scope: !7)
!26 = !DILocation(line: 32, column: 40, scope: !7)
!27 = !DILocation(line: 35, column: 8, scope: !7)
!28 = !DILocation(line: 0, scope: !7)
!29 = !DILocation(line: 35, column: 17, scope: !7)
!30 = !DILocation(line: 35, column: 3, scope: !7)
!31 = !DILocation(line: 37, column: 5, scope: !7)
!32 = !DILocation(line: 37, column: 40, scope: !7)
!33 = !DILocation(line: 38, column: 3, scope: !7)
!34 = !DILocation(line: 35, column: 25, scope: !7)
!35 = distinct !{!35, !30, !33}
!36 = !DILocation(line: 39, column: 40, scope: !7)
!37 = !DILocation(line: 39, column: 38, scope: !7)
!38 = !DILocation(line: 40, column: 36, scope: !7)
!39 = !DILocation(line: 40, column: 34, scope: !7)
!40 = !DILocation(line: 41, column: 1, scope: !7)
!41 = distinct !DISubprogram(name: "svp_simple_022_001_init", scope: !8, file: !8, line: 43, type: !9, scopeLine: 43, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 44, column: 36, scope: !41)
!43 = !DILocation(line: 44, column: 34, scope: !41)
!44 = !DILocation(line: 45, column: 36, scope: !41)
!45 = !DILocation(line: 45, column: 34, scope: !41)
!46 = !DILocation(line: 46, column: 36, scope: !41)
!47 = !DILocation(line: 46, column: 34, scope: !41)
!48 = !DILocation(line: 48, column: 3, scope: !41)
!49 = !DILocation(line: 49, column: 1, scope: !41)
!50 = distinct !DISubprogram(name: "svp_simple_022_001_func_1", scope: !8, file: !8, line: 51, type: !9, scopeLine: 51, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 52, column: 9, scope: !50)
!52 = !DILocation(line: 52, column: 40, scope: !50)
!53 = !DILocation(line: 54, column: 38, scope: !50)
!54 = !DILocation(line: 55, column: 5, scope: !50)
!55 = !DILocation(line: 58, column: 38, scope: !50)
!56 = !DILocation(line: 60, column: 1, scope: !50)
!57 = distinct !DISubprogram(name: "svp_simple_022_001_func_2", scope: !8, file: !8, line: 62, type: !9, scopeLine: 62, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 63, column: 38, scope: !57)
!59 = !DILocation(line: 63, column: 36, scope: !57)
!60 = !DILocation(line: 64, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "svp_simple_022_001_func_3", scope: !8, file: !8, line: 66, type: !9, scopeLine: 66, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 67, column: 7, scope: !61)
!63 = !DILocation(line: 67, column: 38, scope: !61)
!64 = !DILocation(line: 69, column: 36, scope: !61)
!65 = !DILocation(line: 70, column: 3, scope: !61)
!66 = !DILocation(line: 73, column: 36, scope: !61)
!67 = !DILocation(line: 75, column: 1, scope: !61)
!68 = distinct !DISubprogram(name: "svp_simple_022_001_func_4", scope: !8, file: !8, line: 77, type: !9, scopeLine: 77, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 78, column: 36, scope: !68)
!70 = !DILocation(line: 78, column: 34, scope: !68)
!71 = !DILocation(line: 79, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "svp_simple_022_001_isr_1", scope: !8, file: !8, line: 81, type: !9, scopeLine: 81, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 82, column: 34, scope: !72)
!74 = !DILocation(line: 83, column: 1, scope: !72)
